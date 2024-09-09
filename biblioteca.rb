require 'net/http'
require 'json'
require 'uri'

class Biblioteca
  attr_accessor :totalItems

  def initialize
    @estante = {}
  end

  def adicionarLivro(livro)
    @estante[livro.autor] = livro
  end

  def exibirEstante
    if @estante.size > 0
      puts "Livros na estante:"
      @estante.each_value { |livro| livro.exibir }
    else
      puts "Não há livros na estante"
    end
  end

  def consultarApi(nome)
    puts "Digite o nome do livro ou autor"
    puts "Loading..."
    url = URI("https://www.googleapis.com/books/v1/volumes?q=#{nome}")
    
    response = Net::HTTP.get(url)
    data = JSON.parse(response)
    
    self.totalItems = data['totalItems']
    
    if data['items']
      title = data['items'][0]['volumeInfo']['title']
      subtitle = data['items'][0]['volumeInfo']['subtitle']
      author = data['items'][0]['volumeInfo']['authors'] ? data['items'][0]['volumeInfo']['authors'][0] : "Desconhecido"
      publisher = data['items'][0]['volumeInfo']['publisher']
      publishedDate = data['items'][0]['volumeInfo']['publishedDate']
      description = data['items'][0]['volumeInfo']['description']
      
      Livro.new(title, subtitle, author, publisher, publishedDate, description)
    else
      puts "Não foram encontrados itens"
      nil
    end
  end

  def entrada
    puts "Informe o nome do livro ou autor"
    nome = gets.chomp
    livro = consultarApi(nome)
    
    if livro && totalItems.to_i > 0
      livro.exibir
      puts "Deseja ver a descrição? s/n"
      respostadesc = gets.chomp.downcase
      if respostadesc == 's'
        puts livro.descricao
      end
      
      puts "Deseja adicionar na prateleira? s/n"
      respostaPrateleira = gets.chomp.downcase
      if respostaPrateleira == 's'
        adicionarLivro(livro)
      end
      
      puts "Deseja continuar? s/n"
      resposta = gets.chomp.downcase
      resposta
    else
      puts "Não foram encontrados livros"
    end
  end
end
