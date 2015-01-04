module Jekyll

  class Archive < Page
    def initialize(site, base, dir, tag)
      # @site = site
      # @base = base
      # @dir = dir
      # @name = 'index.html'
      # self.process(@name)
      # self.read_yaml(File.join(base, '_layouts'), 'tag_index.html')
      # self.data['tag'] = tag

      # self.data['related'] = []
      # site.tags[tag].each do |post|
      #   post.tags.each do |rel| 
      #     self.data['related'].push(rel)
      #   end
      # end
      # self.data['related'] = self.data['related'].uniq

      # tag_title_prefix = site.config['tag_title_prefix'] || 'Tags: '
      # self.data['title'] = "#{tag_title_prefix}#{tag}"
    end
  end
end