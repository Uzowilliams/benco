terraform {
    backend "remote" {
        hostname = "app.terraform.io"
        organization = "Uzowilliams"
        workspaces {
            name = "benco"
        }
    }
}

