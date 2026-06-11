/**
 * Logical kind of asset being uploaded. Drives the subfolder under `uploads/`
 * and the file-extension allowlist enforced in the controller.
 */
export enum UploadKind {
  Image = 'image',
  Thumbnail = 'thumbnail',
  Audio = 'audio',
  CategoryCover = 'category-cover',
}
