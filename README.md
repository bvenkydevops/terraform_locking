# terraform_locking

# s3 bucket 
<img width="920" height="416" alt="s3 bucket" src="https://github.com/user-attachments/assets/86a273b3-c275-4f92-bbc6-aa9ff912a609" />

# DynamoDB locking file 

<img width="917" height="482" alt="dynamodb_locking" src="https://github.com/user-attachments/assets/a7d173d0-79fc-4e06-a61d-331e1333c1ca" />

# Step 1: Open Two Terminals

Terminal A – will run a long-running Terraform apply.
# terraform apply 

Terminal B – will attempt another Terraform run at the same time.  
# terraform plan

# You will see something like:


<img width="940" height="320" alt="testing locking in terraform =s3+dynamodb" src="https://github.com/user-attachments/assets/9827a3aa-d314-4cf8-86e3-14795b4a1ccd" />


# This confirms Terraform is blocked because the lock exists.


