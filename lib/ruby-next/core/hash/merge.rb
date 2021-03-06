# frozen_string_literal: true

unless {}.method(:merge).arity == -1
  RubyNext.module_eval do
    refine Hash do
      def merge(*others)
        return super if others.size == 1
        return dup if others.size == 0

        merge(others.shift).tap do |new_h|
          others.each { |h| new_h.merge!(h) }
        end
      end
    end
  end
end
