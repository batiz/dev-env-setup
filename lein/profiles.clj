{:repl {:plugins [[cider/cider-nrepl "0.16.0"]
                  [refactor-nrepl "2.3.1"]
                  [lein-cljfmt "0.6.1"]]
        :dependencies [[cljfmt "0.6.1"]]}
 :repl-options {:init (require 'cljfmt.core
                               'clojure.pprint)}}

