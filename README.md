# Deploy Automático com Vagrant e Bash - Ubuntu

Este projeto utiliza **Vagrant** e **Bash** para automatizar a criação de uma máquina virtual Ubuntu com um servidor Apache configurado e um arquivo HTML pronto para uso.

## Tecnologias Utilizadas
- **Vagrant**
- **Bash Script**
- **Apache HTTP Server**
- **Ubuntu**

## Funcionalidades
- Criação de uma máquina virtual com IP público
- Instalação automatizada de atualizações e do Apache
- Clonação de um repositório contendo um arquivo `index.html`
- Inserção automática do arquivo HTML no Apache

## Requisitos
- [Vagrant](https://www.vagrantup.com/)
- [VirtualBox](https://www.virtualbox.org/)
- Git instalado no sistema

## Configuração e Execução
1. **Clone este repositório**
   ```bash
   git clone <URL_DO_SEU_REPOSITORIO>
   cd <PASTA_DO_PROJETO>
   ```

2. **Configure o arquivo `Vagrantfile`**
   O arquivo `Vagrantfile` deve conter uma configuração semelhante a esta:

   ```ruby
   Vagrant.configure("2") do |config|
     config.vm.box = "ubuntu/focal64"
     config.vm.network "public_network", ip: "192.168.18.50"
     config.vm.provider "virtualbox" do |vb|
     vb.memory = "2048"
     vb.cpus = "2"
     vb.name = "Deploy automatico"
     end
     config.vm.boot_timeout = 1000
     config.vm.provision "shell", path: "setup.sh"
   end
   ```

3. **Crie o arquivo `script.sh` com o seguinte conteúdo:**
   ```bash
   #!/bin/bash
    echo "Atualizando servidor"
    echo "----------------------"
    sudo apt-get update
    sudo apt-get upgrade -y
    
    echo "Instalando Apache"
    echo "----------------------"
    sudo apt-get install apache2 -y
    
    echo "Clonando repositório"
    echo "----------------------"
    sudo git clone https://github.com/vinicsalles/frontdeploydevOps.git
    
    cd frontdeploydevOps
    
    sudo cp -R * /var/www/html
    
    ip a
   ```

4. **Inicie a máquina virtual com Vagrant:**
   ```bash
   vagrant up
   ```

5. **Acesse a aplicação**
   - Identifique o IP atribuído e acesse pelo navegador: `http://<IP_DA_VM>`

## Dicas
- Caso queira atualizar o conteúdo do `index.html`, basta alterar o arquivo no repositório clonado e reiniciar o Apache:
  ```bash
  sudo systemctl restart apache2
  ```

## Autor
**Vinicius Salles**.

