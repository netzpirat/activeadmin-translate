module ActiveAdmin
  module Translate
    class << self
      attr_accessor :backend

      def traco?
        backend == :traco
      end

      def globalize?
        backend == :globalize
      end
    end
  end
end