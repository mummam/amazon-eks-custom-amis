
PACKER_VARIABLES := binary_bucket_name binary_bucket_region eks_version eks_build_date cni_plugin_version root_volume_size data_volume_size hardening_flag http_proxy https_proxy no_proxy
# VPC_ID := vpc-0c5a7ad71dfed7975
VPC_ID := vpc-f1fe938c #Default vpc
# SUBNET_ID := subnet-0c9ae92550c50bed3
SUBNET_ID := subnet-7dd8875c #Default vpc
AWS_REGION := us-east-1
# PACKER_FILE := /Users/mmumma/devl/workspaces/verint-vssg/aws/packer-vars.json
PACKER_FILE := 

EKS_BUILD_DATE := 2020-11-02
EKS_115_VERSION := 1.15.12
EKS_116_VERSION := 1.16.15
EKS_117_VERSION := 1.17.12
EKS_118_VERSION := 1.18.9
EKS_119_VERSION := 1.19.6
EKS_121_VERSION := 1.21.2

build:
	packer build \
		--var 'aws_region=$(AWS_REGION)' \
		--var 'vpc_id=$(VPC_ID)' \
		--var 'subnet_id=$(SUBNET_ID)' \
		$(foreach packerVar,$(PACKER_VARIABLES), $(if $($(packerVar)),--var $(packerVar)='$($(packerVar))',)) \
		$(PACKER_FILE)

# Amazon Linux 2
#-----------------------------------------------------
build-al2-1.15:
	$(MAKE) build PACKER_FILE=amazon-eks-node-al2.json eks_version=1.15

build-al2-1.16:
	$(MAKE) build PACKER_FILE=amazon-eks-node-al2.json eks_version=1.16

build-al2-1.17:
	$(MAKE) build PACKER_FILE=amazon-eks-node-al2.json eks_version=1.17

build-al2-1.18:
	$(MAKE) build PACKER_FILE=amazon-eks-node-al2.json eks_version=1.18

build-al2-1.19:
	$(MAKE) build PACKER_FILE=amazon-eks-node-al2.json eks_version=1.19

# Ubuntu 18.04
#-----------------------------------------------------
build-ubuntu1804-1.15:
	$(MAKE) build PACKER_FILE=amazon-eks-node-ubuntu1804.json eks_version=$(EKS_115_VERSION) eks_build_date=$(EKS_BUILD_DATE)

build-ubuntu1804-1.16:
	$(MAKE) build PACKER_FILE=amazon-eks-node-ubuntu1804.json eks_version=$(EKS_116_VERSION) eks_build_date=$(EKS_BUILD_DATE)

build-ubuntu1804-1.17:
	$(MAKE) build PACKER_FILE=amazon-eks-node-ubuntu1804.json eks_version=$(EKS_117_VERSION) eks_build_date=$(EKS_BUILD_DATE)

build-ubuntu1804-1.18:
	$(MAKE) build PACKER_FILE=amazon-eks-node-ubuntu1804.json eks_version=$(EKS_118_VERSION) eks_build_date=$(EKS_BUILD_DATE)

build-ubuntu1804-1.19:
	$(MAKE) build PACKER_FILE=amazon-eks-node-ubuntu1804.json eks_version=$(EKS_119_VERSION) eks_build_date=2021-01-05

# Ubuntu 20.04
#-----------------------------------------------------
build-ubuntu2004-1.15:
	$(MAKE) build PACKER_FILE=amazon-eks-node-ubuntu2004.json eks_version=$(EKS_115_VERSION) eks_build_date=$(EKS_BUILD_DATE)

build-ubuntu2004-1.16:
	$(MAKE) build PACKER_FILE=amazon-eks-node-ubuntu2004.json eks_version=$(EKS_116_VERSION) eks_build_date=$(EKS_BUILD_DATE)

build-ubuntu2004-1.17:
	$(MAKE) build PACKER_FILE=amazon-eks-node-ubuntu2004.json eks_version=$(EKS_117_VERSION) eks_build_date=$(EKS_BUILD_DATE)

build-ubuntu2004-1.18:
	$(MAKE) build PACKER_FILE=amazon-eks-node-ubuntu2004.json eks_version=$(EKS_118_VERSION) eks_build_date=$(EKS_BUILD_DATE)

build-ubuntu2004-1.19:
	$(MAKE) build PACKER_FILE=amazon-eks-node-ubuntu2004.json eks_version=$(EKS_119_VERSION) eks_build_date=2021-01-05

# RHEL 7
#-----------------------------------------------------
build-rhel7-1.15:
	$(MAKE) build PACKER_FILE=amazon-eks-node-rhel7.json eks_version=$(EKS_115_VERSION) eks_build_date=$(EKS_BUILD_DATE)

build-rhel7-1.16:
	$(MAKE) build PACKER_FILE=amazon-eks-node-rhel7.json eks_version=$(EKS_116_VERSION) eks_build_date=$(EKS_BUILD_DATE)

build-rhel7-1.17:
	$(MAKE) build PACKER_FILE=amazon-eks-node-rhel7.json eks_version=$(EKS_117_VERSION) eks_build_date=$(EKS_BUILD_DATE)

build-rhel7-1.18:
	$(MAKE) build PACKER_FILE=amazon-eks-node-rhel7.json eks_version=$(EKS_118_VERSION) eks_build_date=$(EKS_BUILD_DATE)

build-rhel7-1.19:
	$(MAKE) build PACKER_FILE=amazon-eks-node-rhel7.json eks_version=$(EKS_119_VERSION) eks_build_date=2021-01-05

build-rhel7-1.21:
	$(MAKE) build PACKER_FILE=amazon-eks-node-rhel7.json eks_version=$(EKS_121_VERSION) eks_build_date=2021-09-02

# RHEL 8
#-----------------------------------------------------
build-rhel8-1.15:
	$(MAKE) build PACKER_FILE=amazon-eks-node-rhel8.json eks_version=$(EKS_115_VERSION) eks_build_date=$(EKS_BUILD_DATE)

build-rhel8-1.16:
	$(MAKE) build PACKER_FILE=amazon-eks-node-rhel8.json eks_version=$(EKS_116_VERSION) eks_build_date=$(EKS_BUILD_DATE)

build-rhel8-1.17:
	$(MAKE) build PACKER_FILE=amazon-eks-node-rhel8.json eks_version=$(EKS_117_VERSION) eks_build_date=$(EKS_BUILD_DATE)

build-rhel8-1.18:
	$(MAKE) build PACKER_FILE=amazon-eks-node-rhel8.json eks_version=$(EKS_118_VERSION) eks_build_date=$(EKS_BUILD_DATE)

build-rhel8-1.19:
	$(MAKE) build PACKER_FILE=amazon-eks-node-rhel8.json eks_version=$(EKS_119_VERSION) eks_build_date=2021-01-05

# CentOS 7
#-----------------------------------------------------
build-centos7-1.15:
	$(MAKE) build PACKER_FILE=amazon-eks-node-centos7.json eks_version=$(EKS_115_VERSION) eks_build_date=$(EKS_BUILD_DATE)

build-centos7-1.16:
	$(MAKE) build PACKER_FILE=amazon-eks-node-centos7.json eks_version=$(EKS_116_VERSION) eks_build_date=$(EKS_BUILD_DATE)

build-centos7-1.17:
	$(MAKE) build PACKER_FILE=amazon-eks-node-centos7.json eks_version=$(EKS_117_VERSION) eks_build_date=$(EKS_BUILD_DATE)

build-centos7-1.18:
	$(MAKE) build PACKER_FILE=amazon-eks-node-centos7.json eks_version=$(EKS_118_VERSION) eks_build_date=$(EKS_BUILD_DATE)

build-centos7-1.19:
	$(MAKE) build PACKER_FILE=amazon-eks-node-centos7.json eks_version=$(EKS_119_VERSION) eks_build_date=2021-01-05

# CentOS 8
#-----------------------------------------------------
build-centos8-1.15:
	$(MAKE) build PACKER_FILE=amazon-eks-node-centos8.json eks_version=$(EKS_115_VERSION) eks_build_date=$(EKS_BUILD_DATE)

build-centos8-1.16:
	$(MAKE) build PACKER_FILE=amazon-eks-node-centos8.json eks_version=$(EKS_116_VERSION) eks_build_date=$(EKS_BUILD_DATE)

build-centos8-1.17:
	$(MAKE) build PACKER_FILE=amazon-eks-node-centos8.json eks_version=$(EKS_117_VERSION) eks_build_date=$(EKS_BUILD_DATE)

build-centos8-1.18:
	$(MAKE) build PACKER_FILE=amazon-eks-node-centos8.json eks_version=$(EKS_118_VERSION) eks_build_date=$(EKS_BUILD_DATE)

build-centos8-1.19:
	$(MAKE) build PACKER_FILE=amazon-eks-node-centos8.json eks_version=$(EKS_119_VERSION) eks_build_date=2021-01-05


# Windows 1809 Full
#-----------------------------------------------------
build-windows1809full-1.16:
	$(MAKE) build PACKER_FILE=amazon-eks-node-windows1809full.json eks_version=1.16

build-windows1809full-1.17:
	$(MAKE) build PACKER_FILE=amazon-eks-node-windows1809full.json eks_version=1.17

build-windows1809full-1.18:
	$(MAKE) build PACKER_FILE=amazon-eks-node-windows1809full.json eks_version=1.18

build-windows1809full-1.19:
	$(MAKE) build PACKER_FILE=amazon-eks-node-windows1809full.json eks_version=1.19

# Windows 1809 Core
#-----------------------------------------------------
build-windows1809core-1.16:
	$(MAKE) build PACKER_FILE=amazon-eks-node-windows1809core.json eks_version=1.16

build-windows1809core-1.17:
	$(MAKE) build PACKER_FILE=amazon-eks-node-windows1809core.json eks_version=1.17

build-windows1809core-1.18:
	$(MAKE) build PACKER_FILE=amazon-eks-node-windows1809core.json eks_version=1.18

build-windows1809core-1.19:
	$(MAKE) build PACKER_FILE=amazon-eks-node-windows1809core.json eks_version=1.19

# Windows 2004 Core
#-----------------------------------------------------
build-windows2004core-1.16:
	$(MAKE) build PACKER_FILE=amazon-eks-node-windows2004core.json eks_version=1.16

build-windows2004core-1.17:
	$(MAKE) build PACKER_FILE=amazon-eks-node-windows2004core.json eks_version=1.17

build-windows2004core-1.18:
	$(MAKE) build PACKER_FILE=amazon-eks-node-windows2004core.json eks_version=1.18

build-windows2004core-1.19:
	$(MAKE) build PACKER_FILE=amazon-eks-node-windows2004core.json eks_version=1.19
