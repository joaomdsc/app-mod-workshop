#!/bin/bash

set -euo pipefail

# .. keep variables from previous script..

# Uploads folder within your docker container.
# Tweak it for your app code.
MOUNT_PATH='/var/www/html/uploads/'

# Inject a volume mount to your GCS bucket in the right folder.
gcloud --project "$PROJECT_ID" beta run services update "$SERVICE_NAME" \
    --region $GCP_REGION \
    --execution-environment gen2 \
    --add-volume=name=php_uploads,type=cloud-storage,bucket="$BUCKET"  \
    --add-volume-mount=volume=php_uploads,mount-path="$MOUNT_PATH"