(**************************************************************************)
(*                                                                        *)
(*                                 OCaml                                  *)
(*                                                                        *)
(*                       Pierre Chambart, OCamlPro                        *)
(*           Mark Shinwell and Leo White, Jane Street Europe              *)
(*                                                                        *)
(*   Copyright 2016--2019 OCamlPro SAS                                    *)
(*   Copyright 2016--2019 Jane Street Group LLC                           *)
(*                                                                        *)
(*   All rights reserved.  This file is distributed under the terms of    *)
(*   the GNU Lesser General Public License version 2.1, with the          *)
(*   special exception on linking described in the file LICENSE.          *)
(*                                                                        *)
(**************************************************************************)

(** Conversion from Lambda to Flambda. *)

val lambda_to_flambda :
  mode:'mode Flambda_features.mode ->
  symbol_for_global:(Ident.t -> Symbol.t) ->
  big_endian:bool ->
  cmx_loader:Flambda_cmx.loader ->
  module_ident:Ident.t ->
  module_block_size_in_words:int ->
  Lambda.lambda ->
  'mode Closure_conversion.close_program_result
