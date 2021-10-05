Given /the following movie exist:/ do |table|
  table.hashes.each do |movie|
    Movie.create!(title: movie[:title], rating: movie[:rating], release_date: movie[:release_date])
  end
end

Then /I should see "(.*)" before "(.*)"/ do |m1,m2|
  expect(/[\s\S]*#{m1}[\s\S]*#{m2}/).to match(page.body)
end

When /^I press "(.*)" button/ do |button|
  click_button button
end

Then /I should (not )?see the following movies: (.*)$/ do |present, movies_list|
  movies = movies_list.split(', ')
  movies.each do |movie|
    if present.nil?
      expect(page).to have_content(movie)
    else
      expect(page).not_to have_content(movie)
    end
  end
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  ratings = rating_list.split(', ')
  ratings.each do |rating|
    uncheck ? uncheck("ratings[#{rating}]") : (check("ratings[#{rating}]"))
  end
end

Then /I should see all the movies/ do
  expect(page).to have_xpath("//tr", count: 11)
end