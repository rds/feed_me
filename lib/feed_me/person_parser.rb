module FeedMe

  class PersonParser < AbstractParser; end

  class AtomPersonParser < PersonParser
    property :email
    property :name
    property :uri
  end

  class Rss2PersonParser < PersonParser
    attr_reader :uri

    def email
      xml.inner_html.split(/\s+/, 2)[0] if xml
    end

    def name
      xml.inner_html.split(/\s+/, 2)[1].to_s[/\((.*?)\)/, 1] if xml
    end
  end

end
