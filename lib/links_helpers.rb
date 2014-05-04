module LinksHelpers
  def date_links(date, blogname = nil)
    year_link = "<a href='/#{blogname}/#{date.year}.html'>#{date.year}</a>"
    month_link = "<a href='/#{blogname}/#{date.year}/%02d.html'>#{date.mon}</a>" % date.mon
    day_link = "<a href='/#{blogname}/#{date.year}/%02d/%02d.html'>#{date.mday}</a>" % [date.mon, date.mday]
    return "#{year_link}&nbsp;/&nbsp;#{month_link}&nbsp;/&nbsp;#{day_link}"
  end
end
