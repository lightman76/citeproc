
module CiteProc
  class Processor

    include Abbreviate    
    
    @defaults ||= {
      :locale => 'en-US',
      :style  => 'chicago-author-date',
      :engine => 'citeproc-js',
      :format => 'html'
    }

    class << self
      attr_reader :defaults
    end

    attr_reader :options, :engine
        
    def initialize(options = {})
      @options = Processor.defaults.merge(options)
      @engine = Engine.detect(options)
    end
    
  end
end