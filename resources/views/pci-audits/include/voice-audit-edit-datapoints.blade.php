@php $points = 0;  @endphp

@if (count($categories) > 0)
 
    @foreach ($categories as $key => $category)
        <div class="category">
            <div class="title">
                <h4>{{ $key }}</h4>
            </div>
            @if (count($category) > 0)
                <div class="data-points">
                    <table class="table table-hover">
                        @foreach ($category as $item)
                            @php $points++; @endphp
                            <tr>
                                <td width="25%">{{ $item->datapoint->name ?? '' }}</td>
                                <td>{{ $item->datapoint->question ?? '' }}</td>
                                <td class="radios">
                                    <label class="radio-inline qrating"><input type="radio" class="radio" value="{{ $item->datapoint->score }}" name="answer-{{ $item->id }}" @if($item->answer >= 1) checked @endif>Yes</label>
                                    <label class="radio-inline qrating"><input type="radio" class="radio" value="0" name="answer-{{ $item->id }}" @if($item->answer == 0) checked @endif>No</label> 
                                </td>
                            </tr>
                        @endforeach
                    </table>
                </div>

            @else
                <h5 class="text-center">No data points found!</h5>
            @endif

        </div>

    @endforeach
@else
    <h4 class="text-center">No records found</h4>
@endif
