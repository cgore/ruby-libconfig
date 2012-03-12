# Copyright (c) 2012, Christopher Mark Gore,
# All rights reserved.
#
# 8729 Lower Marine Road, Saint Jacob, Illinois 62281 USA.
# Web: http://www.cgore.com
# Email: cgore@cgore.com
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#
#     * Neither the name of Christopher Mark Gore nor the names of other
#       contributors may be used to endorse or promote products derived from
#       this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.


require_relative '../lib/libconfig'

describe NilClass do
  it "has to_libconfig_boolean" do
    nil.to_libconfig_boolean.should == "false"
  end

  it "has to_libconfig_string" do
    nil.to_libconfig_string.should == ""
  end

  it "has to_libconfig defaulting to to_libconfig" do
    nil.to_libconfig.should == nil.to_libconfig_boolean
  end
end

describe Integer do
  it "has to_libconfig_integer" do
    3.to_libconfig_integer.should == "3"
    0.to_libconfig_integer.should == "0"
    -12.to_libconfig_integer.should == "-12"
    12345.to_libconfig_integer.should == "12345"
  end

  it "has to_libconfig_string" do
    3.to_libconfig_string.should == '"3"'
    0.to_libconfig_string.should == '"0"'
    -12.to_libconfig_string.should == '"-12"'
    12345.to_libconfig_string.should == '"12345"'
  end

  it "has to_libconfig defaulting to to_libconfig_integer" do
    100.times do
      n = (rand*10000-5000).floor
      n.to_libconfig.should == n.to_libconfig_integer
    end
  end
end
