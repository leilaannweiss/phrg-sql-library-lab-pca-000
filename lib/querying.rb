def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT title AS 'Title', year AS 'Year Released'
    FROM books
    WHERE series_id=1
    ORDER BY year;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name AS 'Name', motto AS 'Motto'
    FROM characters
    ORDER BY LENGTH(motto)
    DESC LIMIT 1;"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species AS 'Species', COUNT(species) AS 'Species Count'
    FROM characters
    GROUP BY species
    ORDER BY COUNT(species) DESC
    LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name 'Author', subgenres.name AS 'Subgenre'
    FROM authors
    JOIN series ON series.author_id = authors.id
    JOIN subgenres ON series.subgenre_id = subgenres.id;"
end

def select_series_title_with_most_human_characters
  "SELECT title FROM (SELECT series.title AS 'Title',
    COUNT(characters.series_id) AS 'Number of Species'
    FROM SERIES
    INNER JOIN characters
    ON series.id = characters.series_id
    WHERE characters.species = 'human'
    GROUP BY characters.series_id
    ORDER BY 'Number of Species' DESC
    LIMIT 1);"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name AS 'Character Name', COUNT(name) AS 'Count'
    FROM character_books
    INNER JOIN characters
    ON characters.id = character_books.character_id
    GROUP BY characters.name
    ORDER BY COUNT(name) DESC;"
end
