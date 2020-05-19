# install是一个目标，指明make命令所要构建的目标
install:
	@# 给予执行权限
	@# @: 不打印命令，直接执行（make默认先打印命令再执行）
	@chmod +x ./scripts/install.sh
	@./scripts/install.sh

# .PHONY声明 install是伪目标，每次都会执行install对应的命令，而不是会检查是否存在install文件（若存在会导致不执行）
.PHONY: install


# example: 
# 	@chmod +x ./test/example.sh
# 	@./test/example.sh

# .PHONY: example