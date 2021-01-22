
module ArticlesHelper

def all_sources
    Article.all.collect { |a| a.source}.uniq.sort
end

end
