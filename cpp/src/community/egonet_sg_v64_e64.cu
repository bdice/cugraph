/*
 * Copyright (c) 2021-2024, NVIDIA CORPORATION.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "community/egonet_impl.cuh"

namespace cugraph {

// SG FP32

template std::tuple<rmm::device_uvector<int64_t>,
                    rmm::device_uvector<int64_t>,
                    std::optional<rmm::device_uvector<float>>,
                    rmm::device_uvector<size_t>>
extract_ego(raft::handle_t const& handle,
            graph_view_t<int64_t, int64_t, false, false> const& graph_view,
            std::optional<edge_property_view_t<int64_t, float const*>>,
            int64_t* source_vertex,
            int64_t n_subgraphs,
            int64_t radius);

template std::tuple<rmm::device_uvector<int64_t>,
                    rmm::device_uvector<int64_t>,
                    std::optional<rmm::device_uvector<float>>,
                    rmm::device_uvector<size_t>>
extract_ego(raft::handle_t const& handle,
            graph_view_t<int64_t, int64_t, false, false> const& graph_view,
            std::optional<edge_property_view_t<int64_t, float const*>>,
            raft::device_span<int64_t const> source_vertex,
            int64_t radius,
            bool do_expensive_check);

// SG FP64

template std::tuple<rmm::device_uvector<int64_t>,
                    rmm::device_uvector<int64_t>,
                    std::optional<rmm::device_uvector<double>>,
                    rmm::device_uvector<size_t>>
extract_ego(raft::handle_t const& handle,
            graph_view_t<int64_t, int64_t, false, false> const& graph_view,
            std::optional<edge_property_view_t<int64_t, double const*>>,
            int64_t* source_vertex,
            int64_t n_subgraphs,
            int64_t radius);

template std::tuple<rmm::device_uvector<int64_t>,
                    rmm::device_uvector<int64_t>,
                    std::optional<rmm::device_uvector<double>>,
                    rmm::device_uvector<size_t>>
extract_ego(raft::handle_t const& handle,
            graph_view_t<int64_t, int64_t, false, false> const& graph_view,
            std::optional<edge_property_view_t<int64_t, double const*>>,
            raft::device_span<int64_t const> source_vertex,
            int64_t radius,
            bool do_expensive_check);

}  // namespace cugraph
