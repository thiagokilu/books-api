require 'net/http'
require 'json'
require 'uri'

class Biblioteca

  def initialize()
    @estante = {}
  
  end
  
  def adicionarLivro(livro)
   @estante[livro.autor] = livro
  end
  
  def exibirEstante
  puts "Livros na estante:"
  @estante.each_value { |livro| livro.exibir }
  end
  
  end

  def consultarApi(nome)
    puts "Digite o nome do livro ou autor"
      puts "Loading..."
      url = URI("https://www.googleapis.com/books/v1/volumes?q=#{nome}")
      
      response = Net::HTTP.get(url)
      
      data = JSON.parse(response)
      
      title = data['items'][0]['volumeInfo']['title']
      subtitle = data['items'][0]['volumeInfo']['subtitle']
      author = data['items'][0]['volumeInfo']['authors'][0]
      publisher = data['items'][0]['volumeInfo']['publisher']
      publishedDate	= data['items'][0]['volumeInfo']['publishedDate']
      Livro.new(title, subtitle, author, publisher, publishedDate)
  end
  
  def entrada(biblioteca)
  puts "Iforme o nome do livro ou autor"
  nome = gets.chomp()
  livro = consultarApi(nome)
  livro.exibir
  puts "Deja adicionar na prateleira ? s/n"
  respostaPrateleira = gets.chomp.downcase
  if respostaPrateleira == 's'
    biblioteca.adicionarLivro(livro)
  else
  end

  puts "Deseja continuar s/n"
  resposta = gets.chomp.downcase
  resposta
  end