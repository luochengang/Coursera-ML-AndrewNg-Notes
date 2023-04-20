## Copyright (C) 2023 luoch
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} getPreprocessedEmail (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: luoch <luoch@LUOCHENGANG_IND>
## Created: 2023-03-28
% email原文经过preprocessing处理后得到的字符串为s1
% contents_vector是s1对应的单词vector
function contents_vector = getPreprocessedEmail(email_contents)
  contents_vector = cell(0, 1);
  % ========================== Preprocess Email ===========================

  % Find the Headers ( \n\n and remove )
  % Uncomment the following lines if you are working with raw emails with the
  % full headers

  % hdrstart = strfind(email_contents, ([char(10) char(10)]));
  % email_contents = email_contents(hdrstart(1):end);

  try
    % Lower case
    email_contents = lower(email_contents);

    % Strip all HTML
    % Looks for any expression that starts with < and ends with > and replace
    % and does not have any < or > in the tag it with a space

    % dataset可能有编码问题，需要规避
    email_contents = regexprep(email_contents, '<[^<>]+>', ' ');
  catch return;
  end;

  % Handle Numbers
  % Look for one or more characters between 0-9
  email_contents = regexprep(email_contents, '[0-9]+', 'number');

  % Handle URLS
  % Look for strings starting with http:// or https://
  email_contents = regexprep(email_contents, ...
                             '(http|https)://[^\s]*', 'httpaddr');

  % Handle Email Addresses
  % Look for strings with @ in the middle
  email_contents = regexprep(email_contents, '[^\s]+@[^\s]+', 'emailaddr');

  % Handle $ sign
  email_contents = regexprep(email_contents, '[$]+', 'dollar');


  % ========================== Tokenize Email ===========================

  % Process file
  l = 0;

  while ~isempty(email_contents)
    % Tokenize and also get rid of any punctuation
    [str, email_contents] = ...
       strtok(email_contents, ...
              [' @$/#.-:&*+=[]?!(){},''">_<;%' char(10) char(13)]);

         % Remove any non alphanumeric characters
    str = regexprep(str, '[^a-zA-Z0-9]', '');

    % Stem the word
    % (the porterStemmer sometimes has issues, so we use a try catch block)
    try str = porterStemmer(strtrim(str));
    catch str = ''; continue;
    end;

    % Skip the word if it is too short
    if length(str) < 2
       continue;
    end

    contents_vector = [contents_vector ; str];
  endwhile
endfunction
