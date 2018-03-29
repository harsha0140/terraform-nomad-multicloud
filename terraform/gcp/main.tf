module "gcp" {
  source = "/Users/nicj/Developer/terraform/terraform-gcp-hashicorp-suite"

  namespace = "${var.namespace}"
  zone      = "${var.zone}"

  min_servers = "1"
  max_servers = "3"
  min_agents  = "3"
  max_agents  = "5"

  vpc_id   = "${google_compute_network.nomad.name}"
  key_name = "~/.ssh/id_rsa.pub"

  /*
  client_target_groups = ["${aws_alb_target_group.proxy.arn}"]
  server_target_groups = ["${aws_alb_target_group.nomad.arn}"]
  */

  consul_enabled        = true
  consul_version        = "1.0.6"
  consul_join_tag_key   = "autojoin"
  consul_join_tag_value = "${var.namespace}"
  nomad_enabled         = true
  nomad_version         = "0.7.1"
}
