Spree::ProductsHelper.module_eval do

  def product_map(product)
    variant = 0
    full_url = ''
    # TODO: los valores por defecto sacarlos de Spree::Config::Location.default_latitude
    product.location ||= Spree::Location.new(:latitude => 40.689060, :longitude => -74.044636)

    latitude = product.location.latitude
    longitude = product.location.longitude

    case variant
    when 0
      full_url = '/assets/habana.jpg'
    when 1
      url = "http://maps.google.com/maps/api/staticmap"
      options = {}
      options[:size] = '338x244'
      options[:maptype] = 'roadmap'
      options[:sensor] = 'false'
      options[:markers] = "#{latitude},#{longitude},blue"
      options[:center] = "#{latitude},#{longitude}"
      options[:zoom] = 15
      full_url = "#{url}?#{query_string}"
    when 2
      # TODO: resolve issue?? (migue que problema hay aqui??)
      map = GoogleStaticMapsHelper::Map.new :size => '338x244', :sensor => true, :zoom => 7
      marker = GoogleStaticMapsHelper::Marker.new( :lng => longitude, :lat => latitude, :color => 'red', :size => 'normal')
      map << marker
      full_url = map.url
    end
    %<<img src="#{full_url}" width="338" height="244">>.html_safe
  end

end

