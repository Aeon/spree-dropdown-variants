Variant.class_eval do
  def self.find_by_option_types_and_product(option_types, product)
    join_clause = ''
    and_clause = ''

    option_types.each_with_index do |option_type, i|
      join_clause << " INNER JOIN option_values_variants ovv#{i}
                       ON v.id = ovv#{i}.variant_id "
      and_clause << " AND ovv#{i}.option_value_id = #{option_type.last} "
    end
    Variant.find_by_sql("SELECT v.* FROM variants v
                         #{join_clause}
                         WHERE v.product_id = #{product} 
                         #{and_clause};").first
  end
end
