cd dist || { echo "El directorio 'dist' no existe. Asegúrate de que el proceso de construcción se haya ejecutado correctamente."; exit 1; }
# Sincroniza los favicons
aws s3 sync ./ s3://$S3_ORIGIN_BUCKET/ --exclude "*" --include "favicon.ico" --metadata-directive 'REPLACE' --cache-control max-age=31536000,public,must-revalidate --delete
# Sincroniza los archivos de assets (CSS, JS)
aws s3 sync ./assets s3://$S3_ORIGIN_BUCKET/assets --metadata-directive 'REPLACE' --cache-control max-age=31536000,public,must-revalidate --delete
# Sincroniza el archivo HTML (index.html) sin caché
aws s3 sync ./ s3://$S3_ORIGIN_BUCKET/ --exclude "*" --include "index.html" --metadata-directive 'REPLACE' --cache-control no-cache,no-store,must-revalidate --delete