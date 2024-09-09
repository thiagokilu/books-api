class Livro
  attr_reader :titulo, :subtitulo, :autor, :editora, :dataPublicacao, :descricao

  def initialize(titulo, subtitulo, autor, editora, dataPublicacao,descricao)
    @titulo = titulo
    @subtitulo = subtitulo
    @autor = autor
    @editora = editora
    @dataPublicacao = dataPublicacao
    @descricao = descricao
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
