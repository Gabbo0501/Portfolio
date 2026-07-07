export function toThumbnailPath(imagePath) {
  return imagePath.replace(/\.[^.]+$/, '-thumb.jpg');
}