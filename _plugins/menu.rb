module Jekyll
  class RenderMenu < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      "menu"
    end
  end
end

Liquid::Template.register_tag('render_menu', Jekyll::RenderMenu)
