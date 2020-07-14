class BaseSerializer < ActiveModel::Serializer

  def self.conditional_attrs(*attrs)
    attrs.each do |attr|
      attribute attr, if: -> { requested?(attr) }
    end
  end

  def requested?(attr)
    all_fields? || include_field?(attr)
  end

  private

  def all_fields?
    include_field?(:all)
  end

  def optional_fields
    @_optional_fields ||= instance_options[:with].to_s.split(',').map(&:strip)
  end

  def include_field?(field_name)
    optional_fields.include?(field_name.to_s)
  end

  def serialize_nested(collection, options = {})
    ActiveModel::Serializer::CollectionSerializer.new(
      collection, instance_options.merge(options)
    ).as_json
  end
end