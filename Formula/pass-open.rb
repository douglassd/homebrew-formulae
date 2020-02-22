class PassOpen < Formula
  desc "A pass extension to open a site in the default browser"
  homepage "https://github.com/douglassd/pass-extension-open"
  url "https://github.com/douglassd/pass-extension-open/archive/v1.1.0.tar.gz"
  sha256 "7178cc4f7674fd6f9b367e22b985f22ead689f3b61fa254812926e9f866d0e94"
  head "https://github.com/douglassd/pass-extension-open.git"

  depends_on "pass"

  def install
    system "make", "PREFIX=#{prefix}", "BASHCOMPDIR=#{bash_completion}", "install"
  end

  @@enable_extensions = "PASSWORD_STORE_ENABLE_EXTENSIONS=true"
  @@extensions_dir = "PASSWORD_STORE_EXTENSIONS_DIR=#{HOMEBREW_PREFIX}/lib/password-store/extensions"

  def caveats; <<~EOS
    To enable pass to find the installed extension #{name} you have to set the two environment variables

      #{@@enable_extensions}
      #{@@extensions_dir}

    once in your ~/.bash_profile or as prefixes for every call of the extension.
  EOS
  end

end
