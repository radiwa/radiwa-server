# frozen_string_literal: true

class Object
  def deep_compact
    self
  end
end

class Array
  def deep_compact
    r = map(&:crush).compact

    r.empty? ? nil : r
  end
end

class Hash
  def deep_compact
    r = each_with_object({}) do |(k, v), h|
      if (_v = v.crush)
        h[k] = _v
      end
    end

    r.empty? ? nil : r
  end

  def deep_transform_keys
    result = {}
  end
end
