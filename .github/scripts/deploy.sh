cd dist || { echo "El directorio 'dist' no existe."; exit 1; }
aws s3 sync ./ s3://$S3_ORIGIN_BUCKET/ --exclude "*" --include "favicon.ico" --metadata-directive 'REPLACE' --cache-control max-age=31536000,public,must-revalidate --delete
aws s3 sync ./assets s3://$S3_ORIGIN_BUCKET/assets --metadata-directive 'REPLACE' --cache-control max-age=31536000,public,must-revalidate --delete
aws s3 sync ./ s3://$S3_ORIGIN_BUCKET/ --exclude "*" --include "index.html" --metadata-directive 'REPLACE' --cache-control no-cache,no-store,must-revalidate --delete