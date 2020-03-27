$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'directors_database'

def list_of_directors(source)
  director_list=[]
  counter= 0
  while counter<source.length
  director_list << source[counter][:name]
  counter +=1
  end
  director_list
end

def total_gross(source)
    counter = 0
    grand_total = 0
    director_total = directors_totals(source) 
    director_list = list_of_directors(source)
    while counter < director_list.length do
      grand_total += director_total[director_list[counter]]
      counter += 1
    end
    grand_total
  end

def gross_for_director(director_data)
  integer=0
  counter = 0
  while counter < director_data[:movies].length do
  integer += director_data[:movies][counter][:worldwide_gross]
  counter += 1
  end
 integer
end
 
def directors_totals(nds)
  hash = {}
  director_number = 0
  while director_number < nds.length do
    hash[nds[director_number][:name]] = gross_for_director(directors_database[director_number])
    director_number += 1
  end
 hash
end