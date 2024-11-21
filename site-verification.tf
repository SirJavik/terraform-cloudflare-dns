######################################
#           _             _ _        #
#          | |           (_) |       #
#          | | __ ___   ___| | __    #
#      _   | |/ _` \ \ / / | |/ /    #
#     | |__| | (_| |\ V /| |   <     #
#      \____/ \__,_| \_/ |_|_|\_\    #
#                                    #
######################################

# Filename: site-verification.tf
# Description: 
# Version: 1.0.0
# Author: Benjamin Schneider <ich@benjamin-schneider.com>
# Date: 2024-08-21
# Last Modified: 2024-08-21
# Changelog: 
# 1.0.0 - Initial version

resource "cloudflare_record" "site-verification" {
  for_each = terraform_data.google_site_verification_parts
  zone_id  = var.cloudflare_zones[each.value.triggers_replace.domain_with_tld]
  name     = each.value.triggers_replace.fulldomain
  value    = each.value.triggers_replace.payload
  type     = "TXT"
  ttl      = var.cloudflare_proxied_ttl
  comment  = "For Site Verification. Managed by Terraform"
}
