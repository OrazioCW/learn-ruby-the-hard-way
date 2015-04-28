# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "NAME"
  spec.version       = '1.0'
  spec.authors       = ["Vlad"]
  spec.email         = ["vladimir@blinkbox.com"]
  spec.summary       = %q{New Game}
  spec.description   = %q{Long description of the game}
  spec.homepage      = "http://domainforproject.com/"
  spec.license       = "MIT"

  spec.files         = ['lib/NAME.rb', 'lib/ex47/game.rb']
  spec.executables   = ['bin/NAME', 'bin/GAME']
  spec.test_files    = ['tests/test_NAME.rb', 'tests/test_ex47.rb']
  spec.require_paths = ["lib"]
end