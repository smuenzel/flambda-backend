(**************************************************************************)
(*                                                                        *)
(*                                 OCaml                                  *)
(*                                                                        *)
(*                        Guillaume Bury, OCamlPro                        *)
(*                                                                        *)
(*   Copyright 2019--2019 OCamlPro SAS                                    *)
(*                                                                        *)
(*   All rights reserved.  This file is distributed under the terms of    *)
(*   the GNU Lesser General Public License version 2.1, with the          *)
(*   special exception on linking described in the file LICENSE.          *)
(*                                                                        *)
(**************************************************************************)

(** Translation of statically-allocated constants to Cmm. *)

open! Flambda.Import

val static_consts :
  To_cmm_env.t ->
  To_cmm_result.t ->
  params_and_body:
    (To_cmm_env.t ->
    To_cmm_result.t ->
    Code_id.t ->
    Function_params_and_body.t ->
    fun_dbg:Debuginfo.t ->
    check:Check_attribute.t ->
    Cmm.fundecl * To_cmm_result.t) ->
  Bound_static.t ->
  Static_const_group.t ->
  To_cmm_env.t * To_cmm_result.t * Cmm.expression option
