resource "aws_instance" "web-server" {
    provisioner "local-exec"{
        #creation-time provisioner:  only run during creation, not during updating or any other lifecycle.
        # command = "echo '0' > status.txt"
        command = "echo The server's IP address is ${self.private_ip}"
        # Using 'self' here as Referring to a resource by name within its own block would create a dependency cycle.
    }

    provisioner "local-exec"{
        when = destroy #destroy-time provisioner: run before the resource is destroyed.
        # If they fail, Terraform will error and rerun the provisioners again on the next terraform apply
        # command = "echo '1' > status.txt"
        command = "echo 'Destroy-time provisioner'"
    }
}