variable "auth_mongolink" {
  description = "Auth - Mongo database link"
  type        = string
  sensitive   = true
}

variable "auth_jsonpass" {
  description = "Auth - JSON password"
  type        = string
  sensitive   = true
}

variable "auth_mongo_user" {
  description = "Auth - Mongo user"
  type        = string
  sensitive   = true
}

variable "auth_mongo_pass" {
  description = "Auth - Mongo user password"
  type        = string
  sensitive   = true
}

variable "api_db_host" {
  description = "Api - DB host"
  type        = string
  sensitive   = true
}

variable "api_db_user" {
  description = "Api - DB user"
  type        = string
  sensitive   = true
}

variable "api_db_pass" {
  description = "Api - DB password"
  type        = string
  sensitive   = true
}