class BaseSerializer
  attr_accessor :object, :collection
  def initialize(object, opts=nil)
    if object.respond_to?(:each)
      @collection = object
    else
      @object = object
    end
    @options = opts
  end

  def self.attributes(*attrs)
    @@relation ||= { 'has_many' => [], 'belongs_to' => [] }
    @_attributes ||= [*attrs]
  end

  def self.attribute(method)
    @@attribute = []
    @@attribute << method
    # puts .send(method)
    # define_method(method) do |args|
    #   puts "'^^^^^^^^^^^^^^^^^^^^^^^^^^^^'"
    #   puts args
    #   @_attributes << subclass.send(method)
    # end
  end

  def self.has_many(relationship)
    @@relation['has_many'] << relationship
  end

  def self.belongs_to(relationship)
    @@relation['belongs_to'] << relationship
  end


  def get_relations
    @@relation.each do |relation_type, value|
      value.each do |key|
        if @serializable.respond_to?(:each)
          @serializable = @serializable.map do |obj|
            new_obj = OpenStruct.new(obj.attributes)
            new_obj[key] = obj.send(key).map(&:attributes) if obj.respond_to?(key)
            # puts "'^^^^^^^^^^^^^^^^^#{@@attribute}'"
            @@attribute.each { |a| new_obj[a] = self.send(a, obj) if self.respond_to?(a) }
            new_obj
          end
        else
          new_obj = OpenStruct.new(@serializable.attributes)
          new_key = @serializable.send(key) if @serializable.respond_to?(key)
          puts "****************#{new_key.respond_to?(:attributes)}****************"
          new_obj[key] = new_key && new_key.respond_to?(:map) ?
            new_key.map(&:attributes) : new_key.attributes
          @@attribute.each { |a| new_obj[a] = self.send(a) if self.respond_to?(a) }
          # puts '***********************'
          # puts new_obj
        end
      end
    end
  end

  # def serialize_relation(relationship)
  #   if @object && @object._reflections.include?(relationship.to_s)
  #     @object.send(relationship).attributes
  #   elsif @collection && @collection.first._reflections.include?(relationship.to_s)
  #     @collection.map do |model|
  #                   puts "'^^^^^^^^^^^^^^#{model}^^^^^^^^^^^^^^'"

  #       # model.respond_to?(relationship) ?
  #         model.send(relationship).map(&:attributes) if  model.respond_to?(relationship)# : model
  #      #  serializer = collection.try(:klass) ?
  #      #    (collection.klass.name + 'Serializer') : (collection.class.name + 'Serializer')
  #      #  puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!: #{serializer}:#{serializer.constantize.is_a?(Class) rescue false}"
  #      # Module.const_defined?(serializer) ?
  #      #    JSON.parse(serializer.constantize.new(collection).serialize) : collection.to_json
  #     end
  #   end
  # end

  def serialize
    @serializable = @object || @collection
    # self.send()
    get_relations
    @serializable.to_json(only: @_attributes)
  end
end