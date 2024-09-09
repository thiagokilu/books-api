require_relative 'livro'
require_relative 'biblioteca'


def main
  biblioteca = Biblioteca.new
  resposta = 's'
  while resposta != 'n' do
    resposta = biblioteca.entrada
  end

  biblioteca.exibirEstante
end

# Executa a função principal
main
