import {
  BadRequestException,
  Body,
  Controller,
  Post,
  UploadedFile,
  UseGuards,
  UseInterceptors,
} from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import {
  ApiBearerAuth,
  ApiBody,
  ApiConsumes,
  ApiCreatedResponse,
  ApiOperation,
  ApiTags,
} from '@nestjs/swagger';
import { AdminGuard } from '@common/guards/admin.guard';
import { JwtAuthGuard } from '@common/guards/jwt-auth.guard';
import { BEARER_AUTH_NAME } from '@docs/constants';
import { UploadKind } from '../application/dtos/upload-kind.enum';
import { multerOptions, relativePathFor } from '../infrastructure/multer.config';

@ApiTags('admin-upload')
@ApiBearerAuth(BEARER_AUTH_NAME)
@Controller('admin/upload')
@UseGuards(JwtAuthGuard, AdminGuard)
export class UploadController {
  /**
   * Accepts a single file under the `file` field along with a `kind` field
   * that picks the destination folder. Returns the relative path the admin
   * forms should store in DB (mediaUrl() resolves it at read time).
   */
  @Post()
  @ApiOperation({
    summary: 'Upload a media asset (image / thumbnail / audio / category-cover)',
  })
  @ApiConsumes('multipart/form-data')
  @ApiBody({
    schema: {
      type: 'object',
      required: ['file', 'kind'],
      properties: {
        file: { type: 'string', format: 'binary' },
        kind: {
          type: 'string',
          enum: Object.values(UploadKind),
        },
      },
    },
  })
  @ApiCreatedResponse({
    description: 'Returns the stored relative path.',
    schema: {
      type: 'object',
      properties: {
        path: { type: 'string', example: 'images/abc-123.png' },
      },
    },
  })
  @UseInterceptors(FileInterceptor('file', multerOptions))
  upload(
    @UploadedFile() file: Express.Multer.File | undefined,
    @Body('kind') kind: UploadKind,
  ): { path: string } {
    if (!file) {
      throw new BadRequestException('No file received under field "file".');
    }
    return { path: relativePathFor(kind, file.filename) };
  }
}
