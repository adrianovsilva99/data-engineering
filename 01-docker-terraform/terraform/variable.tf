variable "project" {
    description = "Project description"
    default = "terraform-495617"
}

variable "region" {
    description = "Project region"
    default = "us-central1"  
}

variable "location" {
  description = "Project location"
  default = "US"
}


variable "gcs_bucket_name" {
  description = "My storage bucket name"
  default = "terraform_495617_demo_bucket"
}

variable "bq_dataset_name" {
  description = "My big query dataset name"
  default = "demo_dataset"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default = "STANDARD"
}