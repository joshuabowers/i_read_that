class Object
  unless defined?(as)
    def as(&block)
      block_given? ? yield(self) : self
    end
  end
end