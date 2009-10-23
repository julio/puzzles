# class Array
#   def permutations
#     return [self] if size < 2
#     perm = []
#     each { |e| 
#       (self - [e]).permutations.each { |p| 
#         perm << ([e] + p) 
#       } 
#     }
#     perm
#   end
# end
# 
# p (1..4).to_a.permutations

class String
  def permutations
    return [self] if self.length < 2
    all_permutations = []

    0.upto(self.length - 1) do |n|
      rest = self.split('')                
      picked = rest.delete_at(n)
      rest.join.permutations.each do |x| 
        p "#{self}: picked + x => #{picked} + #{x}"
        all_permutations << picked + x 
      end
    end

    all_permutations
  end
end

p "abc".permutations

