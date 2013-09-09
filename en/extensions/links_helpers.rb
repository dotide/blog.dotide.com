module LinksHelpers
  def date_links date
    year_link = "<a href='/en/#{date.year}.html'>#{date.year}</a>"
    month_link = "<a href='/en/#{date.year}/%02d.html'>#{date.mon}</a>" % date.mon
    day_link = "<a href='/en/#{date.year}/%02d/%02d.html'>#{date.mday}</a>" % [date.mon, date.mday]
    return "#{year_link}/#{month_link}/#{day_link}"
  end
end
