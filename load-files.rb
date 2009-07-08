require 'open-uri'
files = ""
0.upto(27) do |index|
  bits = open("http://www.cs.berkeley.edu/~bh/pdf/ssch%02d" % index, 'User-Agent' => 'Ruby-Wget').read
  File.open("book/ss#{index}.pdf", 'w') {|f| f.write(bits)}
  files += " book/ss#{index}.pdf"
end

system("gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=merged.pdf #{files}")
