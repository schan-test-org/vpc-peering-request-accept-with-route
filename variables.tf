############################# main : var #######################################

variable "env" { type = string }
variable "project" { type = string }
variable "default_tags" { type = map(string) }

variable "aws_region" { type = string }
# variable "aws_profile" { type = string }
# variable "suffixnum" { type = number }

############################# requester & accpeter  : var #######################################

# key & secret 정보 tfc 콘솔상에 기재
# 참고로 TFC 에서 String input 만 지원함으로 MAP 객체변수 사용 불가
variable "requester_key" { default = "" }
variable "requester_secret" { default = "" }

variable "accepter_key" { default = "" }
variable "accepter_secret" { default = "" }


############################# requester & accpeter  : var #######################################

#requester
variable "requester_vpc_id" { default = "" }
variable "requester_vpc_name" { default = "" }
variable "requester_vpc_cidr" { default = "" }
variable "requester_route_tables_ids" { default = [] }

#accepter
variable "accepter_vpc_list" {
  description = "A list of maps containing key/value pairs that define vpc peering."
  # type        = map

  type = map(object({
    vpc_id       = optional(string, "")
    vpc_cidr        = optional(string, "")
    acpt_vpc_name       = optional(string, "")
    # owner_id       = optional(string, "")

    # availability_zones  = optional(list(string), [])
    # db_parameter_group_parameters = optional(list(object({
    #   name  = string
    #   value = string
    # })), [])

  }))
}


