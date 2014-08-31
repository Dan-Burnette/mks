
class Library

  attr_accessor :books, :name

  def initialize(name)
    @name = name
    @books = []
  end

  def add_books(book_ary)
    book_ary.each {|x| books.push(x)}
  end

end

class Book
  
  def initialize(name, authors)
    @name = name
    @authors = authors
  end

end

class LibParser 

  #returns an array of book objects
  def self.parse(file)
    #raw = File.read('libtext.txt')
    raw = File.read(file)

    step1 = raw.split("\n\n")
    step2 = step1.map { |x| x.split("\n") }
    step2.flatten!
    step2.delete_at(0)

    books = []
    step2.each do |x|
      sections = x.split(',')
      name = sections[0]
      sections.delete_at(0)
      authors = sections.join()
      book = Book.new(name, authors)
      books.push(book)
    end
    books
  end

end

library = Library.new("library1")
books = LibParser.parse("libtext.txt")
library.add_books(books)






