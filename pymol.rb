require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Pymol < Formula
  homepage 'http://pymol.org'
  url 'http://downloads.sourceforge.net/project/pymol/pymol/1.3r2/pymol-1.3r2-src.tar.bz2'
  sha1 'e9bb50b11063190023f67946484d12d97d5acd81'

depends_on 'glew'
depends_on :libpng
depends_on :x11 # if your formula requires any X11/XQuartz components

  def install
    # ENV.j1  # if your formula's build system can't parallelize
    ENV.prepend 'CPPFLAGS', '-I/usr/X11/include -I/usr/X11/include/freetype2 -I/usr/local/include/GL'
    ENV.prepend 'LDFLAGS', '-lGLEW'

    system "python setup.py build"
    system "python setup.py install --prefix=#{HOMEBREW_PREFIX}/bin"
    system "python setup2.py install --prefix=#{HOMEBREW_PREFIX}/bin"
    # system "ln -s pymol #{HOMEBREW_PREFIX}/bin/pymol"
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test pymol`.
    system "pymol -c"
  end
end
