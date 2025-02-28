(**************************************************************************)
(*                                                                        *)
(*                                 OCaml                                  *)
(*                                                                        *)
(*                       Pierre Chambart, OCamlPro                        *)
(*           Mark Shinwell and Leo White, Jane Street Europe              *)
(*                                                                        *)
(*   Copyright 2013--2019 OCamlPro SAS                                    *)
(*   Copyright 2014--2019 Jane Street Group LLC                           *)
(*                                                                        *)
(*   All rights reserved.  This file is distributed under the terms of    *)
(*   the GNU Lesser General Public License version 2.1, with the          *)
(*   special exception on linking described in the file LICENSE.          *)
(*                                                                        *)
(**************************************************************************)

(** Recording of the uses of a single continuation. This module also computes,
    for each parameter of the continuation, the join of all corresponding
    argument types across the recorded uses; and the environment to be used for
    simplifying the continuation itself. *)

type t

val create : Continuation.t -> Flambda_arity.t -> t

val print : Format.formatter -> t -> unit

val add_use :
  t ->
  Continuation_use_kind.t ->
  env_at_use:Downwards_env.t ->
  Apply_cont_rewrite_id.t ->
  arg_types:Flambda2_types.t list ->
  t

val get_uses : t -> One_continuation_use.t list

type arg_at_use = private
  { arg_type : Flambda2_types.t;
    typing_env : Flambda2_types.Typing_env.t
  }

type arg_types_by_use_id = arg_at_use Apply_cont_rewrite_id.Map.t list

val get_arg_types_by_use_id : t -> arg_types_by_use_id

val number_of_uses : t -> int

val arity : t -> Flambda_arity.t

val get_typing_env_no_more_than_one_use :
  t -> Flambda2_types.Typing_env.t option

val union : t -> t -> t

val mark_non_inlinable : t -> t
