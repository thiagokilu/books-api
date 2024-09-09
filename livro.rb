class Livro
  attr_reader :titulo, :subtitulo, :autor, :editora, :dataPublicacao

  def initialize(titulo, subtitulo, autor, editora, dataPublicacao)
    @titulo = titulo
    @subtitulo = subtitulo
    @autor = autor
    @editora = editora
    @dataPublicacao = dataPublicacao
  end

  def exibir
    puts '-----'
    puts "Título:          #{@titulo}"
    puts "Subtítulo:       #{@subtitulo}"
    puts "Autor:           #{@autor}"
    puts "Editora:         #{@editora}"
    puts "Data de Publicação: #{@dataPublicacao}"
    puts '-----'
  end
  
end
