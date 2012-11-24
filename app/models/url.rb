class Url
  include Mongoid::Document
  field :url, type: String
  field :slug, type: String

  before_save :onsave

  def onsave
 	int = $redis.incr "linkCount"
  	self.slug = Base62.encode int
  end

  def to_param
  	self.slug
  end

end
