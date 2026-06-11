import { randomUUID } from 'node:crypto';
import { extname, join } from 'node:path';
import { existsSync, mkdirSync } from 'node:fs';
import type { MulterOptions } from '@nestjs/platform-express/multer/interfaces/multer-options.interface';
import { diskStorage } from 'multer';
import { BadRequestException } from '@nestjs/common';
import { UploadKind } from '../application/dtos/upload-kind.enum';

export const UPLOADS_ROOT = join(process.cwd(), 'uploads');

const KIND_FOLDER: Record<UploadKind, string> = {
  [UploadKind.Image]: 'images',
  [UploadKind.Thumbnail]: 'thumbnails',
  [UploadKind.Audio]: 'audio',
  [UploadKind.CategoryCover]: 'categories',
};

const IMAGE_EXTS = ['.png', '.jpg', '.jpeg', '.webp', '.gif'];
const AUDIO_EXTS = ['.mp3', '.m4a', '.aac', '.wav', '.ogg'];

function allowedExtsFor(kind: UploadKind): string[] {
  return kind === UploadKind.Audio ? AUDIO_EXTS : IMAGE_EXTS;
}

function ensureDir(path: string) {
  if (!existsSync(path)) mkdirSync(path, { recursive: true });
}

ensureDir(UPLOADS_ROOT);

/**
 * Multer options shared by the upload controller. The destination is chosen
 * from the `kind` field on the body, so the route reads files into the right
 * subfolder without a second hop.
 */
export const multerOptions: MulterOptions = {
  limits: {
    fileSize: 25 * 1024 * 1024,
  },
  fileFilter: (req, file, cb) => {
    const kind = (req.body?.kind ?? req.query?.kind) as UploadKind | undefined;
    if (!kind || !Object.values(UploadKind).includes(kind)) {
      return cb(
        new BadRequestException(
          `Missing or invalid "kind" field. Allowed: ${Object.values(UploadKind).join(', ')}`,
        ),
        false,
      );
    }
    const ext = extname(file.originalname).toLowerCase();
    if (!allowedExtsFor(kind).includes(ext)) {
      return cb(
        new BadRequestException(
          `Extension ${ext || '(none)'} not allowed for kind "${kind}". Allowed: ${allowedExtsFor(kind).join(', ')}`,
        ),
        false,
      );
    }
    cb(null, true);
  },
  storage: diskStorage({
    destination: (req, _file, cb) => {
      const kind = (req.body?.kind ?? req.query?.kind) as UploadKind;
      const sub = KIND_FOLDER[kind];
      const dir = join(UPLOADS_ROOT, sub);
      ensureDir(dir);
      cb(null, dir);
    },
    filename: (_req, file, cb) => {
      const ext = extname(file.originalname).toLowerCase();
      cb(null, `${randomUUID()}${ext}`);
    },
  }),
};

/**
 * Builds the relative path that the frontend stores in DB and later resolves
 * via mediaUrl(). Example: `images/abc-123.png` → `/static/images/abc-123.png`.
 */
export function relativePathFor(kind: UploadKind, filename: string): string {
  return `${KIND_FOLDER[kind]}/${filename}`;
}
