#!/bin/bash

# ::Adicionando bulma jquery fontawesome no projeto
echo 'Adicionando bulma jquery fontawesome ao projeto'
yarn add bulma jquery @fortawesome/fontawesome-free

# ::Adicionando os arquivos as pastas
echo 'Atualizando o arquivo: environment.js'
cp ./arq/environment.js config/webpack/environment.js
sleep 3s

echo 'Atualizando o arquivo: application.js'
cp  ./arq/application.js app/javascript/packs/application.js
sleep 3s

echo 'Atualizando o arquivo: custom.js'
cp  ./arq/custom.js app/javascript/packs/custom.js
sleep 3s

echo 'Atualizando o arquivo: application.scss'
rm -rf ./app/assets/stylesheets/application.css
cp ./arq/application.scss app/assets/stylesheets/application.scss
sleep 3s

echo 'Atualizando o arquivo: custom.scss'
cp  ./arq/custom.scss app/assets/stylesheets/custom.scss
sleep 3s

echo 'Atualizando o arquivo: application.html.haml'
rm -rf ./app/views/layouts/application.html.erb
cp  ./arq/application.html.haml app/views/layouts/application.html.haml
sleep 3s

echo 'Adicionando os arquivos: gemfile|awesome_print|generator'
rm -rf ./Gemfile
cp ./arq/Gemfile Gemfile
sleep 3s
bundle install
sleep 3s
cp ./arq/awesome_print.rb config/initializers/awesome_print.rb
cp ./arq/generators.rb config/initializers/generators.rb

echo 'Arquivos atualizados com sucesso!!!'
